// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class OrdersQry: EntityValue {
    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "OrderID")

    public static let customerID: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "CustomerID")

    public static let employeeID: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "EmployeeID")

    public static let orderDate: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "OrderDate")

    public static let requiredDate: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "RequiredDate")

    public static let shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShippedDate")

    public static let shipVia: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipVia")

    public static let freight: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Freight")

    public static let shipName: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipName")

    public static let shipAddress: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipAddress")

    public static let shipCity: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipCity")

    public static let shipRegion: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipRegion")

    public static let shipPostalCode: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipPostalCode")

    public static let shipCountry: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "ShipCountry")

    public static let companyName: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "CompanyName")

    public static let address: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Address")

    public static let city: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "City")

    public static let region: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Region")

    public static let postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "PostalCode")

    public static let country: Property = NorthwindEntitiesMetadata.EntityTypes.ordersQry.property(withName: "Country")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.ordersQry)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.address))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<OrdersQry> {
        return ArrayConverter.convert(from.toArray(), Array<OrdersQry>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.city))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.city, to: StringValue.of(optional: value))
        }
    }

    open var companyName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: OrdersQry.companyName))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.companyName, to: StringValue.of(value))
        }
    }

    open func copy() -> OrdersQry {
        return CastRequired<OrdersQry>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.country))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.country, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.customerID))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.customerID, to: StringValue.of(optional: value))
        }
    }

    open var employeeID: Int? {
        get {
            return IntValue.optional(self.dataValue(for: OrdersQry.employeeID))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.employeeID, to: IntValue.of(optional: value))
        }
    }

    open var freight: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: OrdersQry.freight))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.freight, to: DecimalValue.of(optional: value))
        }
    }

    open class func key(companyName: String, orderID: Int) -> EntityKey {
        return EntityKey().with(name: "CompanyName", value: StringValue.of(companyName)).with(name: "OrderID", value: IntValue.of(orderID))
    }

    open var old: OrdersQry {
        get {
            return CastRequired<OrdersQry>.from(self.oldEntity)
        }
    }

    open var orderDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: OrdersQry.orderDate))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.orderDate, to: value)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: OrdersQry.orderID))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.orderID, to: IntValue.of(value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.postalCode))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.region))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.region, to: StringValue.of(optional: value))
        }
    }

    open var requiredDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: OrdersQry.requiredDate))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.requiredDate, to: value)
        }
    }

    open var shipAddress: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.shipAddress))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipAddress, to: StringValue.of(optional: value))
        }
    }

    open var shipCity: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.shipCity))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipCity, to: StringValue.of(optional: value))
        }
    }

    open var shipCountry: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.shipCountry))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipCountry, to: StringValue.of(optional: value))
        }
    }

    open var shipName: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.shipName))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipName, to: StringValue.of(optional: value))
        }
    }

    open var shipPostalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.shipPostalCode))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipPostalCode, to: StringValue.of(optional: value))
        }
    }

    open var shipRegion: String? {
        get {
            return StringValue.optional(self.dataValue(for: OrdersQry.shipRegion))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipRegion, to: StringValue.of(optional: value))
        }
    }

    open var shipVia: Int? {
        get {
            return IntValue.optional(self.dataValue(for: OrdersQry.shipVia))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shipVia, to: IntValue.of(optional: value))
        }
    }

    open var shippedDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: OrdersQry.shippedDate))
        }
        set(value) {
            self.setDataValue(for: OrdersQry.shippedDate, to: value)
        }
    }
}
