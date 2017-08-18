// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class CategorySalesFor1997: EntityValue {
    public static let categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.property(withName: "CategoryName")

    public static let categorySales: Property = NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997.property(withName: "CategorySales")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.categorySalesFor1997)
    }

    open class func array(from: EntityValueList) -> Array<CategorySalesFor1997> {
        return ArrayConverter.convert(from.toArray(), Array<CategorySalesFor1997>())
    }

    open var categoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: CategorySalesFor1997.categoryName))
        }
        set(value) {
            self.setDataValue(for: CategorySalesFor1997.categoryName, to: StringValue.of(value))
        }
    }

    open var categorySales: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: CategorySalesFor1997.categorySales))
        }
        set(value) {
            self.setDataValue(for: CategorySalesFor1997.categorySales, to: DecimalValue.of(optional: value))
        }
    }

    open func copy() -> CategorySalesFor1997 {
        return CastRequired<CategorySalesFor1997>.from(self.copyEntity())
    }

    open class func key(categoryName: String) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(categoryName))
    }

    open var old: CategorySalesFor1997 {
        get {
            return CastRequired<CategorySalesFor1997>.from(self.oldEntity)
        }
    }
}
