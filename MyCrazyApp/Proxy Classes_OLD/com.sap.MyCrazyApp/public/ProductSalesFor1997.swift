// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class ProductSalesFor1997: EntityValue {
    public static let categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "CategoryName")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "ProductName")

    public static let productSales: Property = NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997.property(withName: "ProductSales")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.productSalesFor1997)
    }

    open class func array(from: EntityValueList) -> Array<ProductSalesFor1997> {
        return ArrayConverter.convert(from.toArray(), Array<ProductSalesFor1997>())
    }

    open var categoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ProductSalesFor1997.categoryName))
        }
        set(value) {
            self.setDataValue(for: ProductSalesFor1997.categoryName, to: StringValue.of(value))
        }
    }

    open func copy() -> ProductSalesFor1997 {
        return CastRequired<ProductSalesFor1997>.from(self.copyEntity())
    }

    open class func key(categoryName: String, productName: String) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(categoryName)).with(name: "ProductName", value: StringValue.of(productName))
    }

    open var old: ProductSalesFor1997 {
        get {
            return CastRequired<ProductSalesFor1997>.from(self.oldEntity)
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ProductSalesFor1997.productName))
        }
        set(value) {
            self.setDataValue(for: ProductSalesFor1997.productName, to: StringValue.of(value))
        }
    }

    open var productSales: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: ProductSalesFor1997.productSales))
        }
        set(value) {
            self.setDataValue(for: ProductSalesFor1997.productSales, to: DecimalValue.of(optional: value))
        }
    }
}
