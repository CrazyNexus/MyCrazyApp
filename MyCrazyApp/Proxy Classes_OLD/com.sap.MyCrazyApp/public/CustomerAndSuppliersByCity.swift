// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class CustomerAndSuppliersByCity: EntityValue {
    public static let city: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "City")

    public static let companyName: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "CompanyName")

    public static let contactName: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "ContactName")

    public static let relationship: Property = NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity.property(withName: "Relationship")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.customerAndSuppliersByCity)
    }

    open class func array(from: EntityValueList) -> Array<CustomerAndSuppliersByCity> {
        return ArrayConverter.convert(from.toArray(), Array<CustomerAndSuppliersByCity>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: CustomerAndSuppliersByCity.city))
        }
        set(value) {
            self.setDataValue(for: CustomerAndSuppliersByCity.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: CustomerAndSuppliersByCity.companyName))
        }
        set(value) {
            self.setDataValue(for: CustomerAndSuppliersByCity.companyName, to: StringValue.of(value))
        }
    }

    open var contactName: String? {
        get {
            return StringValue.optional(self.dataValue(for: CustomerAndSuppliersByCity.contactName))
        }
        set(value) {
            self.setDataValue(for: CustomerAndSuppliersByCity.contactName, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> CustomerAndSuppliersByCity {
        return CastRequired<CustomerAndSuppliersByCity>.from(self.copyEntity())
    }

    open class func key(companyName: String, relationship: String) -> EntityKey {
        return EntityKey().with(name: "CompanyName", value: StringValue.of(companyName)).with(name: "Relationship", value: StringValue.of(relationship))
    }

    open var old: CustomerAndSuppliersByCity {
        get {
            return CastRequired<CustomerAndSuppliersByCity>.from(self.oldEntity)
        }
    }

    open var relationship: String {
        get {
            return StringValue.unwrap(self.dataValue(for: CustomerAndSuppliersByCity.relationship))
        }
        set(value) {
            self.setDataValue(for: CustomerAndSuppliersByCity.relationship, to: StringValue.of(value))
        }
    }
}
