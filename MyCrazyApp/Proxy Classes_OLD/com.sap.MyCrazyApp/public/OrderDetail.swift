// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class OrderDetail: EntityValue {
    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "OrderID")

    public static let productID: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "ProductID")

    public static let unitPrice: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "UnitPrice")

    public static let quantity: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Quantity")

    public static let discount: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Discount")

    public static let order: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Order")

    public static let product: Property = NorthwindEntitiesMetadata.EntityTypes.orderDetail.property(withName: "Product")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.orderDetail)
    }

    open class func array(from: EntityValueList) -> Array<OrderDetail> {
        return ArrayConverter.convert(from.toArray(), Array<OrderDetail>())
    }

    open func copy() -> OrderDetail {
        return CastRequired<OrderDetail>.from(self.copyEntity())
    }

    open var discount: Float {
        get {
            return FloatValue.unwrap(self.dataValue(for: OrderDetail.discount))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.discount, to: FloatValue.of(value))
        }
    }

    open class func key(orderID: Int, productID: Int) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(orderID)).with(name: "ProductID", value: IntValue.of(productID))
    }

    open var old: OrderDetail {
        get {
            return CastRequired<OrderDetail>.from(self.oldEntity)
        }
    }

    open var order: Order {
        get {
            return CastRequired<Order>.from(self.dataValue(for: OrderDetail.order))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.order, to: value)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: OrderDetail.orderID))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.orderID, to: IntValue.of(value))
        }
    }

    open var product: Product {
        get {
            return CastRequired<Product>.from(self.dataValue(for: OrderDetail.product))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.product, to: value)
        }
    }

    open var productID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: OrderDetail.productID))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.productID, to: IntValue.of(value))
        }
    }

    open var quantity: Int {
        get {
            return ShortValue.unwrap(self.dataValue(for: OrderDetail.quantity))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.quantity, to: ShortValue.of(value))
        }
    }

    open var unitPrice: BigDecimal {
        get {
            return DecimalValue.unwrap(self.dataValue(for: OrderDetail.unitPrice))
        }
        set(value) {
            self.setDataValue(for: OrderDetail.unitPrice, to: DecimalValue.of(value))
        }
    }
}
