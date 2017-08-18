// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class SalesByCategory: EntityValue {
    public static let categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "CategoryID")

    public static let categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "CategoryName")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "ProductName")

    public static let productSales: Property = NorthwindEntitiesMetadata.EntityTypes.salesByCategory.property(withName: "ProductSales")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.salesByCategory)
    }

    open class func array(from: EntityValueList) -> Array<SalesByCategory> {
        return ArrayConverter.convert(from.toArray(), Array<SalesByCategory>())
    }

    open var categoryID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: SalesByCategory.categoryID))
        }
        set(value) {
            self.setDataValue(for: SalesByCategory.categoryID, to: IntValue.of(value))
        }
    }

    open var categoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SalesByCategory.categoryName))
        }
        set(value) {
            self.setDataValue(for: SalesByCategory.categoryName, to: StringValue.of(value))
        }
    }

    open func copy() -> SalesByCategory {
        return CastRequired<SalesByCategory>.from(self.copyEntity())
    }

    open class func key(categoryID: Int, categoryName: String, productName: String) -> EntityKey {
        return EntityKey().with(name: "CategoryID", value: IntValue.of(categoryID)).with(name: "CategoryName", value: StringValue.of(categoryName)).with(name: "ProductName", value: StringValue.of(productName))
    }

    open var old: SalesByCategory {
        get {
            return CastRequired<SalesByCategory>.from(self.oldEntity)
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: SalesByCategory.productName))
        }
        set(value) {
            self.setDataValue(for: SalesByCategory.productName, to: StringValue.of(value))
        }
    }

    open var productSales: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: SalesByCategory.productSales))
        }
        set(value) {
            self.setDataValue(for: SalesByCategory.productSales, to: DecimalValue.of(optional: value))
        }
    }
}
