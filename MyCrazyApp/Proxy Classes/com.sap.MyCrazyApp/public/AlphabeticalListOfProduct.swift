// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class AlphabeticalListOfProduct: EntityValue {
    public static let productID: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ProductID")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ProductName")

    public static let supplierID: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "SupplierID")

    public static let categoryID: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "CategoryID")

    public static let quantityPerUnit: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "QuantityPerUnit")

    public static let unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitPrice")

    public static let unitsInStock: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitsInStock")

    public static let unitsOnOrder: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "UnitsOnOrder")

    public static let reorderLevel: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "ReorderLevel")

    public static let discontinued: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "Discontinued")

    public static let categoryName: Property = NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct.property(withName: "CategoryName")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.alphabeticalListOfProduct)
    }

    open class func array(from: EntityValueList) -> Array<AlphabeticalListOfProduct> {
        return ArrayConverter.convert(from.toArray(), Array<AlphabeticalListOfProduct>())
    }

    open var categoryID: Int? {
        get {
            return IntValue.optional(self.dataValue(for: AlphabeticalListOfProduct.categoryID))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.categoryID, to: IntValue.of(optional: value))
        }
    }

    open var categoryName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: AlphabeticalListOfProduct.categoryName))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.categoryName, to: StringValue.of(value))
        }
    }

    open func copy() -> AlphabeticalListOfProduct {
        return CastRequired<AlphabeticalListOfProduct>.from(self.copyEntity())
    }

    open var discontinued: Bool {
        get {
            return BooleanValue.unwrap(self.dataValue(for: AlphabeticalListOfProduct.discontinued))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.discontinued, to: BooleanValue.of(value))
        }
    }

    open class func key(categoryName: String, discontinued: Bool, productID: Int, productName: String) -> EntityKey {
        return EntityKey().with(name: "CategoryName", value: StringValue.of(categoryName)).with(name: "Discontinued", value: BooleanValue.of(discontinued)).with(name: "ProductID", value: IntValue.of(productID)).with(name: "ProductName", value: StringValue.of(productName))
    }

    open var old: AlphabeticalListOfProduct {
        get {
            return CastRequired<AlphabeticalListOfProduct>.from(self.oldEntity)
        }
    }

    open var productID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: AlphabeticalListOfProduct.productID))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.productID, to: IntValue.of(value))
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: AlphabeticalListOfProduct.productName))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.productName, to: StringValue.of(value))
        }
    }

    open var quantityPerUnit: String? {
        get {
            return StringValue.optional(self.dataValue(for: AlphabeticalListOfProduct.quantityPerUnit))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.quantityPerUnit, to: StringValue.of(optional: value))
        }
    }

    open var reorderLevel: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: AlphabeticalListOfProduct.reorderLevel))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.reorderLevel, to: ShortValue.of(optional: value))
        }
    }

    open var supplierID: Int? {
        get {
            return IntValue.optional(self.dataValue(for: AlphabeticalListOfProduct.supplierID))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.supplierID, to: IntValue.of(optional: value))
        }
    }

    open var unitPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: AlphabeticalListOfProduct.unitPrice))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.unitPrice, to: DecimalValue.of(optional: value))
        }
    }

    open var unitsInStock: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: AlphabeticalListOfProduct.unitsInStock))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.unitsInStock, to: ShortValue.of(optional: value))
        }
    }

    open var unitsOnOrder: Int? {
        get {
            return ShortValue.optional(self.dataValue(for: AlphabeticalListOfProduct.unitsOnOrder))
        }
        set(value) {
            self.setDataValue(for: AlphabeticalListOfProduct.unitsOnOrder, to: ShortValue.of(optional: value))
        }
    }
}
