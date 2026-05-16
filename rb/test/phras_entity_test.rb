# Phras entity test

require "minitest/autorun"
require "json"
require_relative "../Techy_sdk"
require_relative "runner"

class PhrasEntityTest < Minitest::Test
  def test_create_instance
    testsdk = TechySDK.test(nil, nil)
    ent = testsdk.Phras(nil)
    assert !ent.nil?
  end

  def test_basic_flow
    setup = phras_basic_setup(nil)
    # Per-op sdk-test-control.json skip.
    _live = setup[:live] || false
    ["load"].each do |_op|
      _should_skip, _reason = Runner.is_control_skipped("entityOp", "phras." + _op, _live ? "live" : "unit")
      if _should_skip
        skip(_reason || "skipped via sdk-test-control.json")
        return
      end
    end
    # The basic flow consumes synthetic IDs from the fixture. In live mode
    # without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup[:synthetic_only]
      skip "live entity test uses synthetic IDs from fixture — set TECHY_TEST_PHRAS_ENTID JSON to run live"
      return
    end
    client = setup[:client]

    # Bootstrap entity data from existing test data.
    phras_ref01_data_raw = Vs.items(Helpers.to_map(
      Vs.getpath(setup[:data], "existing.phras")))
    phras_ref01_data = nil
    if phras_ref01_data_raw.length > 0
      phras_ref01_data = Helpers.to_map(phras_ref01_data_raw[0][1])
    end

    # LOAD
    phras_ref01_ent = client.Phras(nil)
    phras_ref01_match_dt0 = {}
    phras_ref01_data_dt0_loaded, err = phras_ref01_ent.load(phras_ref01_match_dt0, nil)
    assert_nil err
    assert !phras_ref01_data_dt0_loaded.nil?

  end
end

def phras_basic_setup(extra)
  Runner.load_env_local

  entity_data_file = File.join(__dir__, "..", "..", ".sdk", "test", "entity", "phras", "PhrasTestData.json")
  entity_data_source = File.read(entity_data_file)
  entity_data = JSON.parse(entity_data_source)

  options = {}
  options["entity"] = entity_data["existing"]

  client = TechySDK.test(options, extra)

  # Generate idmap via transform.
  idmap = Vs.transform(
    ["phras01", "phras02", "phras03"],
    {
      "`$PACK`" => ["", {
        "`$KEY`" => "`$COPY`",
        "`$VAL`" => ["`$FORMAT`", "upper", "`$COPY`"],
      }],
    }
  )

  # Detect ENTID env override before envOverride consumes it. When live
  # mode is on without a real override, the basic test runs against synthetic
  # IDs from the fixture and 4xx's. Surface this so the test can skip.
  entid_env_raw = ENV["TECHY_TEST_PHRAS_ENTID"]
  idmap_overridden = !entid_env_raw.nil? && entid_env_raw.strip.start_with?("{")

  env = Runner.env_override({
    "TECHY_TEST_PHRAS_ENTID" => idmap,
    "TECHY_TEST_LIVE" => "FALSE",
    "TECHY_TEST_EXPLAIN" => "FALSE",
    "TECHY_APIKEY" => "NONE",
  })

  idmap_resolved = Helpers.to_map(
    env["TECHY_TEST_PHRAS_ENTID"])
  if idmap_resolved.nil?
    idmap_resolved = Helpers.to_map(idmap)
  end

  if env["TECHY_TEST_LIVE"] == "TRUE"
    merged_opts = Vs.merge([
      {
        "apikey" => env["TECHY_APIKEY"],
      },
      extra || {},
    ])
    client = TechySDK.new(Helpers.to_map(merged_opts))
  end

  live = env["TECHY_TEST_LIVE"] == "TRUE"
  {
    client: client,
    data: entity_data,
    idmap: idmap_resolved,
    env: env,
    explain: env["TECHY_TEST_EXPLAIN"] == "TRUE",
    live: live,
    synthetic_only: live && !idmap_overridden,
    now: (Time.now.to_f * 1000).to_i,
  }
end
