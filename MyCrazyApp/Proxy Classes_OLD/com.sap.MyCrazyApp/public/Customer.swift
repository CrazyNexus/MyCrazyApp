// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class Customer: EntityValue {
    public static let customerID: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CustomerID")

    public static let companyName: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CompanyName")

    public static let contactName: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "ContactName")

    public static let contactTitle: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "ContactTitle")

    public static let address: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Address")

    public static let city: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "City")

    public static let region: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Region")

    public static let postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "PostalCode")

    public static let country: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Country")

    public static let phone: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Phone")

    public static let fax: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Fax")

    public static let orders: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "Orders")

    public static let customerDemographics: Property = NorthwindEntitiesMetadata.EntityTypes.customer.property(withName: "CustomerDemographics")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.customer)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.address))
        }
        set(value) {
            self.setDataValue(for: Customer.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Customer> {
        return ArrayConverter.convert(from.toArray(), Array<Customer>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.city))
        }
        set(value) {
            self.setDataValue(for: Customer.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Customer.companyName))
        }
        set(value) {
            self.setDataValue(for: Customer.companyName, to: StringValue.of(value))
        }
    }

    open var contactName: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.contactName))
        }
        set(value) {
            self.setDataValue(for: Customer.contactName, to: StringValue.of(optional: value))
        }
    }

    open var contactTitle: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.contactTitle))
        }
        set(value) {
            self.setDataValue(for: Customer.contactTitle, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Customer {
        return CastRequired<Customer>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.country))
        }
        set(value) {
            self.setDataValue(for: Customer.country, to: StringValue.of(optional: value))
        }
    }

    open var customerDemographics: Array<CustomerDemographic> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Customer.customerDemographics)).toArray(), Array<CustomerDemographic>())
        }
        set(value) {
            Customer.customerDemographics.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var customerID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Customer.customerID))
        }
        set(value) {
            self.setDataValue(for: Customer.customerID, to: StringValue.of(value))
        }
    }

    open var fax: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.fax))
        }
        set(value) {
            self.setDataValue(for: Customer.fax, to: StringValue.of(optional: value))
        }
    }

    open class func key(customerID: String) -> EntityKey {
        return EntityKey().with(name: "CustomerID", value: StringValue.of(customerID))
    }

    open var old: Customer {
        get {
            return CastRequired<Customer>.from(self.oldEntity)
        }
    }

    open var orders: Array<Order> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Customer.orders)).toArray(), Array<Order>())
        }
        set(value) {
            Customer.orders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.phone))
        }
        set(value) {
            self.setDataValue(for: Customer.phone, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.postalCode))
        }
        set(value) {
            self.setDataValue(for: Customer.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.dataValue(for: Customer.region))
        }
        set(value) {
            self.setDataValue(for: Customer.region, to: StringValue.of(optional: value))
        }
    }
}
