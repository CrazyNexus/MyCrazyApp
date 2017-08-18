// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Product: EntityValue {
    public static let productID: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ProductID")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ProductName")

    public static let supplierID: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "SupplierID")

    public static let categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "CategoryID")

    public static let quantityPerUnit: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "QuantityPerUnit")

    public static let unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitPrice")

    public static let unitsInStock: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitsInStock")

    public static let unitsOnOrder: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "UnitsOnOrder")

    public static let reorderLevel: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "ReorderLevel")

    public static let discontinued: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Discontinued")

    public static let category: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Category")

    public static let orderDetails: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Order_Details")

    public static let supplier: Property = NorthwindEntitiesMetadata.EntityTypes.product.property(withName: "Supplier")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.product)
    }

    open class func array(from: EntityValueList) -> Array<Product> {
        return ArrayConverter.convert(from.toArray(), Array<Product>())
    }

    open var category: Category? {
        get {
            return CastOptional<Category>.from(self.dataValue(for: Product.category))
        }
        set(value) {
            self.setDataValue(for: Product.category, to: value)
        }
    }

    open var categoryID: Int? {
        get {
            return IntValue.optional(self.dataValue(for: Product.categoryID))
        }
        set(value) {
            self.setDataValue(for: Product.categoryID, to: IntValue.of(optional: value))
        }
    }

    open func copy() -> Product {
        return CastRequired<Product>.from(self.copyEntity())
    }

    open var discontinued: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: Product.discontinued))
        }
        set(value) {
            self.setDataValue(for: Product.discontinued, to: BooleanValue.of(value))
        }
    }

    open class func key(productID: Int) -> EntityKey {
        return EntityKey().with(name: "ProductID", value: IntValue.of(productID))
    }

    open var old: Product {
        get {
            return CastRequired<Product>.from(self.oldEntity)
        }
    }

    open var orderDetails: Array<OrderDetail> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Product.orderDetails)).toArray(), Array<OrderDetail>())
        }
        set(value) {
            Product.orderDetails.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var productID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Product.productID))
        }
        set(value) {
            self.setDataValue(for: Product.productID, to: IntValue.of(value))
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Product.productName))
        }
        set(value) {
            self.setDataValue(for: Product.productName, to: StringValue.of(value))
        }
    }

    open var quantityPerUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: Product.quantityPerUnit))
        }
        set(value) {
            self.setDataValue(for: Product.quantityPerUnit, to: StringValue.of(optional: value))
        }
    }

    open var reorderLevel: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: Product.reorderLevel))
        }
        set(value) {
            self.setDataValue(for: Product.reorderLevel, to: ShortValue.of(optional: value))
        }
    }

    open var supplier: Supplier? {
        get {
            return CastOptional<Supplier>.from(self.dataValue(for: Product.supplier))
        }
        set(value) {
            self.setDataValue(for: Product.supplier, to: value)
        }
    }

    open var supplierID: Int? {
        get {
            return IntValue.optional(self.dataValue(for: Product.supplierID))
        }
        set(value) {
            self.setDataValue(for: Product.supplierID, to: IntValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: Product.unitPrice))
        }
        set(value) {
            self.setDataValue(for: Product.unitPrice, to: DecimalValue.of(optional: value))
        }
    }

    open var unitsInStock: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: Product.unitsInStock))
        }
        set(value) {
            self.setDataValue(for: Product.unitsInStock, to: ShortValue.of(optional: value))
        }
    }

    open var unitsOnOrder: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: Product.unitsOnOrder))
        }
        set(value) {
            self.setDataValue(for: Product.unitsOnOrder, to: ShortValue.of(optional: value))
        }
    }
}
