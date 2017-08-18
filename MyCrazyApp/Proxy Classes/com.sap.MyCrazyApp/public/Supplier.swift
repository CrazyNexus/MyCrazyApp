// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Supplier: EntityValue {
    public static let supplierID: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "SupplierID")

    public static let companyName: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "CompanyName")

    public static let contactName: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactName")

    public static let contactTitle: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "ContactTitle")

    public static let address: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Address")

    public static let city: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "City")

    public static let region: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Region")

    public static let postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "PostalCode")

    public static let country: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Country")

    public static let phone: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Phone")

    public static let fax: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Fax")

    public static let homePage: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "HomePage")

    public static let products: Property = NorthwindEntitiesMetadata.EntityTypes.supplier.property(withName: "Products")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.supplier)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.address))
        }
        set(value) {
            self.setDataValue(for: Supplier.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Supplier> {
        return ArrayConverter.convert(from.toArray(), Array<Supplier>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.city))
        }
        set(value) {
            self.setDataValue(for: Supplier.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Supplier.companyName))
        }
        set(value) {
            self.setDataValue(for: Supplier.companyName, to: StringValue.of(value))
        }
    }

    open var contactName: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.contactName))
        }
        set(value) {
            self.setDataValue(for: Supplier.contactName, to: StringValue.of(optional: value))
        }
    }

    open var contactTitle: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.contactTitle))
        }
        set(value) {
            self.setDataValue(for: Supplier.contactTitle, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Supplier {
        return CastRequired<Supplier>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.country))
        }
        set(value) {
            self.setDataValue(for: Supplier.country, to: StringValue.of(optional: value))
        }
    }

    open var fax: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.fax))
        }
        set(value) {
            self.setDataValue(for: Supplier.fax, to: StringValue.of(optional: value))
        }
    }

    open var homePage: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.homePage))
        }
        set(value) {
            self.setDataValue(for: Supplier.homePage, to: StringValue.of(optional: value))
        }
    }

    open class func key(supplierID: Int) -> EntityKey {
        return EntityKey().with(name: "SupplierID", value: IntValue.of(supplierID))
    }

    open var old: Supplier {
        get {
            return CastRequired<Supplier>.from(self.oldEntity)
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.phone))
        }
        set(value) {
            self.setDataValue(for: Supplier.phone, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.postalCode))
        }
        set(value) {
            self.setDataValue(for: Supplier.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var products: Array<Product> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Supplier.products)).toArray(), Array<Product>())
        }
        set(value) {
            Supplier.products.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.dataValue(for: Supplier.region))
        }
        set(value) {
            self.setDataValue(for: Supplier.region, to: StringValue.of(optional: value))
        }
    }

    open var supplierID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Supplier.supplierID))
        }
        set(value) {
            self.setDataValue(for: Supplier.supplierID, to: IntValue.of(value))
        }
    }
}
