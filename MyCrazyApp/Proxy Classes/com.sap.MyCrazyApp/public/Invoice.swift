// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Invoice: EntityValue {
    public static let shipName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipName")

    public static let shipAddress: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipAddress")

    public static let shipCity: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipCity")

    public static let shipRegion: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipRegion")

    public static let shipPostalCode: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipPostalCode")

    public static let shipCountry: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipCountry")

    public static let customerID: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "CustomerID")

    public static let customerName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "CustomerName")

    public static let address: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Address")

    public static let city: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "City")

    public static let region: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Region")

    public static let postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "PostalCode")

    public static let country: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Country")

    public static let salesperson: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Salesperson")

    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "OrderID")

    public static let orderDate: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "OrderDate")

    public static let requiredDate: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "RequiredDate")

    public static let shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShippedDate")

    public static let shipperName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ShipperName")

    public static let productID: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ProductID")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ProductName")

    public static let unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "UnitPrice")

    public static let quantity: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Quantity")

    public static let discount: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Discount")

    public static let extendedPrice: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "ExtendedPrice")

    public static let freight: Property = NorthwindEntitiesMetadata.EntityTypes.invoice.property(withName: "Freight")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.invoice)
    }

    open var address: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.address))
        }
        set(value) {
            self.setDataValue(for: Invoice.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Invoice> {
        return ArrayConverter.convert(from.toArray(), Array<Invoice>())
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.city))
        }
        set(value) {
            self.setDataValue(for: Invoice.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Invoice {
        return CastRequired<Invoice>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.country))
        }
        set(value) {
            self.setDataValue(for: Invoice.country, to: StringValue.of(optional: value))
        }
    }

    open var customerID: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.customerID))
        }
        set(value) {
            self.setDataValue(for: Invoice.customerID, to: StringValue.of(optional: value))
        }
    }

    open var customerName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Invoice.customerName))
        }
        set(value) {
            self.setDataValue(for: Invoice.customerName, to: StringValue.of(value))
        }
    }

    open var discount: Float {
        get {
            return FloatValue.unwrap(self.dataValue(for: Invoice.discount))
        }
        set(value) {
            self.setDataValue(for: Invoice.discount, to: FloatValue.of(value))
        }
    }

    open var extendedPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: Invoice.extendedPrice))
        }
        set(value) {
            self.setDataValue(for: Invoice.extendedPrice, to: DecimalValue.of(optional: value))
        }
    }

    open var freight: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: Invoice.freight))
        }
        set(value) {
            self.setDataValue(for: Invoice.freight, to: DecimalValue.of(optional: value))
        }
    }

    open class func key(customerName: String, discount: Float, orderID: Int, productID: Int, productName: String, quantity: Int, salesperson: String, shipperName: String, unitPrice: BigDecimal) -> EntityKey {
        return EntityKey().with(name: "CustomerName", value: StringValue.of(customerName)).with(name: "Discount", value: FloatValue.of(discount)).with(name: "OrderID", value: IntValue.of(orderID)).with(name: "ProductID", value: IntValue.of(productID)).with(name: "ProductName", value: StringValue.of(productName)).with(name: "Quantity", value: ShortValue.of(quantity)).with(name: "Salesperson", value: StringValue.of(salesperson)).with(name: "ShipperName", value: StringValue.of(shipperName)).with(name: "UnitPrice", value: DecimalValue.of(unitPrice))
    }

    open var old: Invoice {
        get {
            return CastRequired<Invoice>.from(self.oldEntity)
        }
    }

    open var orderDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Invoice.orderDate))
        }
        set(value) {
            self.setDataValue(for: Invoice.orderDate, to: value)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Invoice.orderID))
        }
        set(value) {
            self.setDataValue(for: Invoice.orderID, to: IntValue.of(value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.postalCode))
        }
        set(value) {
            self.setDataValue(for: Invoice.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var productID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Invoice.productID))
        }
        set(value) {
            self.setDataValue(for: Invoice.productID, to: IntValue.of(value))
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Invoice.productName))
        }
        set(value) {
            self.setDataValue(for: Invoice.productName, to: StringValue.of(value))
        }
    }

    open var quantity: Int {
        get {
            return ShortValue.unwrap(self.dataValue(for: Invoice.quantity))
        }
        set(value) {
            self.setDataValue(for: Invoice.quantity, to: ShortValue.of(value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.region))
        }
        set(value) {
            self.setDataValue(for: Invoice.region, to: StringValue.of(optional: value))
        }
    }

    open var requiredDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Invoice.requiredDate))
        }
        set(value) {
            self.setDataValue(for: Invoice.requiredDate, to: value)
        }
    }

    open var salesperson: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Invoice.salesperson))
        }
        set(value) {
            self.setDataValue(for: Invoice.salesperson, to: StringValue.of(value))
        }
    }

    open var shipAddress: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.shipAddress))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipAddress, to: StringValue.of(optional: value))
        }
    }

    open var shipCity: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.shipCity))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipCity, to: StringValue.of(optional: value))
        }
    }

    open var shipCountry: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.shipCountry))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipCountry, to: StringValue.of(optional: value))
        }
    }

    open var shipName: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.shipName))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipName, to: StringValue.of(optional: value))
        }
    }

    open var shipPostalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.shipPostalCode))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipPostalCode, to: StringValue.of(optional: value))
        }
    }

    open var shipRegion: String? {
        get {
            return StringValue.optional(self.dataValue(for: Invoice.shipRegion))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipRegion, to: StringValue.of(optional: value))
        }
    }

    open var shippedDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Invoice.shippedDate))
        }
        set(value) {
            self.setDataValue(for: Invoice.shippedDate, to: value)
        }
    }

    open var shipperName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Invoice.shipperName))
        }
        set(value) {
            self.setDataValue(for: Invoice.shipperName, to: StringValue.of(value))
        }
    }

    open var unitPrice: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: Invoice.unitPrice))
        }
        set(value) {
            self.setDataValue(for: Invoice.unitPrice, to: DecimalValue.of(value))
        }
    }
}
