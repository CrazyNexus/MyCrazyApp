// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class CustomerDemographic: EntityValue {
    public static let customerTypeID: Property = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "CustomerTypeID")

    public static let customerDesc: Property = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "CustomerDesc")

    public static let customers: Property = NorthwindEntitiesMetadata.EntityTypes.customerDemographic.property(withName: "Customers")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.customerDemographic)
    }

    open class func array(from: EntityValueList) -> Array<CustomerDemographic> {
        return ArrayConverter.convert(from.toArray(), Array<CustomerDemographic>())
    }

    open func copy() -> CustomerDemographic {
        return CastRequired<CustomerDemographic>.from(self.copyEntity())
    }

    open var customerDesc: String? {
        get {
            return StringValue.optional(self.dataValue(for: CustomerDemographic.customerDesc))
        }
        set(value) {
            self.setDataValue(for: CustomerDemographic.customerDesc, to: StringValue.of(optional: value))
        }
    }

    open var customerTypeID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: CustomerDemographic.customerTypeID))
        }
        set(value) {
            self.setDataValue(for: CustomerDemographic.customerTypeID, to: StringValue.of(value))
        }
    }

    open var customers: Array<Customer> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: CustomerDemographic.customers)).toArray(), Array<Customer>())
        }
        set(value) {
            CustomerDemographic.customers.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(customerTypeID: String) -> EntityKey {
        return EntityKey().with(name: "CustomerTypeID", value: StringValue.of(customerTypeID))
    }

    open var old: CustomerDemographic {
        get {
            return CastRequired<CustomerDemographic>.from(self.oldEntity)
        }
    }
}
