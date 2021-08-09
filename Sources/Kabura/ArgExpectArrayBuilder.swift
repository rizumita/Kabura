//
// Created by 和泉田 領一 on 2021/07/24.
//

import Foundation

@resultBuilder
public struct ArgExpectArrayBuilder {
    public static func buildBlock<AE: ArgExpect>(_ components: AE...) -> [AE] {
        components
    }
}
