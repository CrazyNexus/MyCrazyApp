// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class ProductsByCategory: EntityValue {
    public static let categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "CategoryName")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "ProductName")

    public static let quantityPerUnit: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "QuantityPerUnit")

    public static let unitsInStock: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "UnitsInStock")

    public static let discontinued: Property = NorthwindEntitiesMetadata.EntityTypes.productsByCategory.property(withName: "Discontinued")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.productsByCategory)
    }

    open class func array(from: EntityValueList) -> Array<ProductsByCategory> {
        return ArrayConverter.convert(from.toArray(), Array<ProductsByCategory>())
    }

    open var categoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ProductsByCategory.categoryName))
        }
        set(value) {
            self.setDataValue(for: ProductsByCategory.categoryName, to: StringValue.of(value))
        }
    }

    open func copy() -> ProductsByCategory {
        return CastRequired<ProductsByCategory>.from(self.copyEntity())
    }

    open var discontinued: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: ProductsByCategory.discontinued))
        }
        set(value) {
            self.setDataValue(for: ProductsByCategory.discontinued, to: BooleanValue.of(value))
        }
    }

    open class func key(categoryName: String, discontinued: Bool, productName: String) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(categoryName)).with(name: "Discontinued", value: BooleanValue.of(discontinued)).with(name: "ProductName", value: StringValue.of(productName))
    }

    open var old: ProductsByCategory {
        get {
            return CastRequired<ProductsByCategory>.from(self.oldEntity)
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: ProductsByCategory.productName))
        }
        set(value) {
            self.setDataValue(for: ProductsByCategory.productName, to: StringValue.of(value))
        }
    }

    open var quantityPerUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: ProductsByCategory.quantityPerUnit))
        }
        set(value) {
            self.setDataValue(for: ProductsByCategory.quantityPerUnit, to: StringValue.of(optional: value))
        }
    }

    open var unitsInStock: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: ProductsByCategory.unitsInStock))
        }
        set(value) {
            self.setDataValue(for: ProductsByCategory.unitsInStock, to: ShortValue.of(optional: value))
        }
    }
}
