
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { TechySDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await TechySDK.test()
    equal(null !== testsdk, true)
  })

})
