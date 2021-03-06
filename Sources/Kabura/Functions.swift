//
// Created by 和泉田 領一 on 2021/08/07.
//

import Foundation

public func params<AE>(@ArgExpectArrayBuilder _ generate: () -> [AE]) -> Params<AE> where AE: ArgExpect {
    Params(aes: generate())
}

public func verify<AE>(_ params: Params<AE>, test: (AE.AEType) -> ()) where AE: ArgExpect {
    params.verify(test)
}

public func verify<AE>(@ArgExpectArrayBuilder _ generate: () -> [AE], test: (AE.AEType) -> ()) where AE: ArgExpect {
    Params(aes: generate()).verify(test)
}
