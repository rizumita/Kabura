//
// Created by 和泉田 領一 on 2021/08/07.
//

import Foundation

public struct Params<AE> where AE: ArgExpect {
    let aes: [AE]

    func verify(_ f: (AE.AEType) -> ()) {
        aes.forEach {
            $0.verify(f)
        }
    }
}
