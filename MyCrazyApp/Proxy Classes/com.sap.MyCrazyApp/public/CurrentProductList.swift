// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class CurrentProductList: EntityValue {
    public static let productID: Property = NorthwindEntitiesMetadata.EntityTypes.currentProductList.property(withName: "ProductID")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.currentProductList.property(withName: "ProductName")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.currentProductList)
    }

    open class func array(from: EntityValueList) -> Array<CurrentProductList> {
        return ArrayConverter.convert(from.toArray(), Array<CurrentProductList>())
    }

    open func copy() -> CurrentProductList {
        return CastRequired<CurrentProductList>.from(self.copyEntity())
    }

    open class func key(productID: Int, productName: String) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: IntValue.of(productID)).with(name: "ProductName", value: StringValue.of(productName))
    }

    open var old: CurrentProductList {
        get {
            return CastRequired<CurrentProductList>.from(self.oldEntity)
        }
    }

    open var productID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: CurrentProductList.productID))
        }
        set(value) {
            self.setDataValue(for: CurrentProductList.productID, to: IntValue.of(value))
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: CurrentProductList.productName))
        }
        set(value) {
            self.setDataValue(for: CurrentProductList.productName, to: StringValue.of(value))
        }
    }
}
