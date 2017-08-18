// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class OrderSubtotal: EntityValue {
    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.property(withName: "OrderID")

    public static let subtotal: Property = NorthwindEntitiesMetadata.EntityTypes.orderSubtotal.property(withName: "Subtotal")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.orderSubtotal)
    }

    open class func array(from: EntityValueList) -> Array<OrderSubtotal> {
        return ArrayConverter.convert(from.toArray(), Array<OrderSubtotal>())
    }

    open func copy() -> OrderSubtotal {
        return CastRequired<OrderSubtotal>.from(self.copyEntity())
    }

    open class func key(orderID: Int) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(orderID))
    }

    open var old: OrderSubtotal {
        get {
            return CastRequired<OrderSubtotal>.from(self.oldEntity)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: OrderSubtotal.orderID))
        }
        set(value) {
            self.setDataValue(for: OrderSubtotal.orderID, to: IntValue.of(value))
        }
    }

    open var subtotal: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: OrderSubtotal.subtotal))
        }
        set(value) {
            self.setDataValue(for: OrderSubtotal.subtotal, to: DecimalValue.of(optional: value))
        }
    }
}
