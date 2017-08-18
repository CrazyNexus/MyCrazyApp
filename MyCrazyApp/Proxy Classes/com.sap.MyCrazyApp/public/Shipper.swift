// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Shipper: EntityValue {
    public static let shipperID: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "ShipperID")

    public static let companyName: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "CompanyName")

    public static let phone: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "Phone")

    public static let orders: Property = NorthwindEntitiesMetadata.EntityTypes.shipper.property(withName: "Orders")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.shipper)
    }

    open class func array(from: EntityValueList) -> Array<Shipper> {
        return ArrayConverter.convert(from.toArray(), Array<Shipper>())
    }

    open var companyName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Shipper.companyName))
        }
        set(value) {
            self.setDataValue(for: Shipper.companyName, to: StringValue.of(value))
        }
    }

    open func copy() -> Shipper {
        return CastRequired<Shipper>.from(self.copyEntity())
    }

    open class func key(shipperID: Int) -> EntityKey {
        return EntityKey().with(name: "ShipperID", value: IntValue.of(shipperID))
    }

    open var old: Shipper {
        get {
            return CastRequired<Shipper>.from(self.oldEntity)
        }
    }

    open var orders: Array<Order> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Shipper.orders)).toArray(), Array<Order>())
        }
        set(value) {
            Shipper.orders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.dataValue(for: Shipper.phone))
        }
        set(value) {
            self.setDataValue(for: Shipper.phone, to: StringValue.of(optional: value))
        }
    }

    open var shipperID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Shipper.shipperID))
        }
        set(value) {
            self.setDataValue(for: Shipper.shipperID, to: IntValue.of(value))
        }
    }
}
