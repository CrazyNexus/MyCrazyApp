// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Category: EntityValue {
    public static let categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "CategoryID")

    public static let categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "CategoryName")

    public static let description: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Description")

    public static let picture: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Picture")

    public static let products: Property = NorthwindEntitiesMetadata.EntityTypes.category.property(withName: "Products")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.category)
    }

    open class func array(from: EntityValueList) -> Array<Category> {
        return ArrayConverter.convert(from.toArray(), Array<Category>())
    }

    open var categoryID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Category.categoryID))
        }
        set(value) {
            self.setDataValue(for: Category.categoryID, to: IntValue.of(value))
        }
    }

    open var categoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Category.categoryName))
        }
        set(value) {
            self.setDataValue(for: Category.categoryName, to: StringValue.of(value))
        }
    }

    open func copy() -> Category {
        return CastRequired<Category>.from(self.copyEntity())
    }

    open var description: String? {
        get {
            return StringValue.optional(self.dataValue(for: Category.description))
        }
        set(value) {
            self.setDataValue(for: Category.description, to: StringValue.of(optional: value))
        }
    }

    open class func key(categoryID: Int) -> EntityKey {
        return EntityKey().with(name: "CategoryID", value: IntValue.of(categoryID))
    }

    open var old: Category {
        get {
            return CastRequired<Category>.from(self.oldEntity)
        }
    }

    open var picture: Data? {
        get {
            return BinaryValue.optional(self.dataValue(for: Category.picture))
        }
        set(value) {
            self.setDataValue(for: Category.picture, to: BinaryValue.of(optional: value))
        }
    }

    open var products: Array<Product> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Category.products)).toArray(), Array<Product>())
        }
        set(value) {
            Category.products.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}
