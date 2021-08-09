//
// Created by 和泉田 領一 on 2021/08/07.
//

import Foundation

precedencegroup ArgExpectPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
}

infix operator =>: ArgExpectPrecedence

public func =><A, B>(_ a: A, _ b: B) -> Arg1Expect<A, B> {
    Arg1Expect(arg1: a, expect: b)
}

public func |<A, B, C>(_ a: A, _ arg1Expect: Arg1Expect<B, C>) -> Arg2Expect<A, B, C> {
    Arg2Expect(arg1: a, arg2: arg1Expect.arg1, expect: arg1Expect.expect)
}

public func l<AE>(_ ae: AE, _ line: UInt = #line) -> AE.LinedAE where AE: ArgExpect {
    ae.setLine(line)
}
