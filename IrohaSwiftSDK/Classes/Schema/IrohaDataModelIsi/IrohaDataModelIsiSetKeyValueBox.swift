//
// Copyright 2021 Soramitsu Co., Ltd.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import IrohaSwiftScale

extension IrohaDataModelIsi {
public struct SetKeyValueBox: Codable {
    
    public var objectId: IrohaDataModel.IdBox
    public var key: String
    public var value: IrohaDataModel.Value
    
    public init(objectId: IrohaDataModel.IdBox, key: String, value: IrohaDataModel.Value) {
    self.objectId = objectId
        self.key = key
        self.value = value
    }
}
}