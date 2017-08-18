// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class ProductsAboveAveragePrice: EntityValue {
    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.property(withName: "ProductName")

    public static let unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice.property(withName: "UnitPrice")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.productsAboveAveragePrice)
    }

    open class func array(from: EntityValueList) -> Array<ProductsAboveAveragePrice> {
        return ArrayConverter.convert(from.toArray(), Array<ProductsAboveAveragePrice>())
    }

    open func copy() -> ProductsAboveAveragePrice {
        return CastRequired<ProductsAboveAveragePrice>.from(self.copyEntity())
    }

    open class func key(productName: String) -> EntityKey {
        return EntityKey().with(name: "ProductName", value: StringValue.of(productName))
    }

    open var old: ProductsAboveAveragePrice {
        get {
            return CastRequired<ProductsAboveAveragePrice>.from(self.oldEntity)
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ProductsAboveAveragePrice.productName))
        }
        set(value) {
            self.setDataValue(for: ProductsAboveAveragePrice.productName, to: StringValue.of(value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: ProductsAboveAveragePrice.unitPrice))
        }
        set(value) {
            self.setDataValue(for: ProductsAboveAveragePrice.unitPrice, to: DecimalValue.of(optional: value))
        }
    }
}
