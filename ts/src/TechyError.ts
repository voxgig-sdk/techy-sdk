
import { Context } from './Context'


class TechyError extends Error {

  isTechyError = true

  sdk = 'Techy'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  TechyError
}

