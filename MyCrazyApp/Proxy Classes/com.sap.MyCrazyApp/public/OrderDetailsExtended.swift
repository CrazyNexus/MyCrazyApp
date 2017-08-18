// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class OrderDetailsExtended: EntityValue {
    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "OrderID")

    public static let productID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ProductID")

    public static let productName: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ProductName")

    public static let unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "UnitPrice")

    public static let quantity: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "Quantity")

    public static let discount: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "Discount")

    public static let extendedPrice: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended.property(withName: "ExtendedPrice")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.orderDetailsExtended)
    }

    open class func array(from: EntityValueList) -> Array<OrderDetailsExtended> {
        return ArrayConverter.convert(from.toArray(), Array<OrderDetailsExtended>())
    }

    open func copy() -> OrderDetailsExtended {
        return CastRequired<OrderDetailsExtended>.from(self.copyEntity())
    }

    open var discount: Float {
        get {
            return FloatValue.unwrap(self.dataValue(for: OrderDetailsExtended.discount))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.discount, to: FloatValue.of(value))
        }
    }

    open var extendedPrice: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: OrderDetailsExtended.extendedPrice))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.extendedPrice, to: DecimalValue.of(optional: value))
        }
    }

    open class func key(discount: Float, orderID: Int, productID: Int, productName: String, quantity: Int, unitPrice: BigDecimal) -> EntityKey {
        return EntityKey().with(name: "Discount", value: FloatValue.of(discount)).with(name: "OrderID", value: IntValue.of(orderID)).with(name: "ProductID", value: IntValue.of(productID)).with(name: "ProductName", value: StringValue.of(productName)).with(name: "Quantity", value: ShortValue.of(quantity)).with(name: "UnitPrice", value: DecimalValue.of(unitPrice))
    }

    open var old: OrderDetailsExtended {
        get {
            return CastRequired<OrderDetailsExtended>.from(self.oldEntity)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: OrderDetailsExtended.orderID))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.orderID, to: IntValue.of(value))
        }
    }

    open var productID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: OrderDetailsExtended.productID))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.productID, to: IntValue.of(value))
        }
    }

    open var productName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: OrderDetailsExtended.productName))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.productName, to: StringValue.of(value))
        }
    }

    open var quantity: Int {
        get {
            return ShortValue.unwrap(self.dataValue(for: OrderDetailsExtended.quantity))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.quantity, to: ShortValue.of(value))
        }
    }

    open var unitPrice: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: OrderDetailsExtended.unitPrice))
        }
        set(value) {
            self.setDataValue(for: OrderDetailsExtended.unitPrice, to: DecimalValue.of(value))
        }
    }
}
