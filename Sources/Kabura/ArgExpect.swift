//
// Created by 和泉田 領一 on 2021/08/07.
//

import Foundation

public protocol ArgExpect {
    associatedtype AEType
    associatedtype LinedAE

    var ae: AEType { get }

    func setLine(_ line: UInt) -> LinedAE
    func verify(_ f: (AEType) -> ())
}

extension ArgExpect {
    public func verify(_ f: (AEType) -> ()) {
        f(ae)
    }
}

public struct Arg1Expect<A1, E>: ArgExpect {
    public typealias AEType = (A1, E)

    let arg1: A1
    let expect: E
    public var ae: (A1, E) { (arg1, expect) }

    public func setLine(_ line: UInt) -> LinedArg1Expect<A1, E> {
        LinedArg1Expect(arg1: arg1, expect: expect, line: line)
    }
}

public struct Arg2Expect<A1, A2, E>: ArgExpect {
    public typealias AEType = (A1, A2, E)

    let arg1: A1
    let arg2: A2
    let expect: E
    public var ae: (A1, A2, E) { (arg1, arg2, expect) }

    public func setLine(_ line: UInt) -> LinedArg2Expect<A1, A2, E> {
        LinedArg2Expect(arg1: arg1, arg2: arg2, expect: expect, line: line)
    }
}

public struct Arg3Expect<A1, A2, A3, E>: ArgExpect {
    public typealias AEType = (A1, A2, A3, E)

    let arg1: A1
    let arg2: A2
    let arg3: A3
    let expect: E
    public var ae: (A1, A2, A3, E) { (arg1, arg2, arg3, expect) }

    public func setLine(_ line: UInt) -> LinedArg3Expect<A1, A2, A3, E> {
        LinedArg3Expect(arg1: arg1, arg2: arg2, arg3: arg3, expect: expect, line: line)
    }
}

public struct LinedArg1Expect<A1, E>: ArgExpect {
    public typealias AEType = (A1, E, UInt)

    let arg1: A1
    let expect: E
    var line: UInt
    public var ae: (A1, E, UInt) { (arg1, expect, line) }

    public func setLine(_ line: UInt) -> Self {
        var result = self
        result.line = line
        return result
    }
}

public struct LinedArg2Expect<A1, A2, E>: ArgExpect {
    public typealias AEType = (A1, A2, E, UInt)

    let arg1: A1
    let arg2: A2
    let expect: E
    var line: UInt
    public var ae: (A1, A2, E, UInt) { (arg1, arg2, expect, line) }

    public func setLine(_ line: UInt) -> Self {
        var result = self
        result.line = line
        return result
    }
}

public struct LinedArg3Expect<A1, A2, A3, E>: ArgExpect {
    public typealias AEType = (A1, A2, A3, E, UInt)

    let arg1: A1
    let arg2: A2
    let arg3: A3
    let expect: E
    var line: UInt
    public var ae: (A1, A2, A3, E, UInt) { (arg1, arg2, arg3, expect, line) }

    public func setLine(_ line: UInt) -> Self {
        var result = self
        result.line = line
        return result
    }
}
