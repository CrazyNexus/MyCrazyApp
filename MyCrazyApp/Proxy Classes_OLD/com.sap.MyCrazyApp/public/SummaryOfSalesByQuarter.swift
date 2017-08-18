// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class SummaryOfSalesByQuarter: EntityValue {
    public static let shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "ShippedDate")

    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "OrderID")

    public static let subtotal: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter.property(withName: "Subtotal")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByQuarter)
    }

    open class func array(from: EntityValueList) -> Array<SummaryOfSalesByQuarter> {
        return ArrayConverter.convert(from.toArray(), Array<SummaryOfSalesByQuarter>())
    }

    open func copy() -> SummaryOfSalesByQuarter {
        return CastRequired<SummaryOfSalesByQuarter>.from(self.copyEntity())
    }

    open class func key(orderID: Int) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(orderID))
    }

    open var old: SummaryOfSalesByQuarter {
        get {
            return CastRequired<SummaryOfSalesByQuarter>.from(self.oldEntity)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: SummaryOfSalesByQuarter.orderID))
        }
        set(value) {
            self.setDataValue(for: SummaryOfSalesByQuarter.orderID, to: IntValue.of(value))
        }
    }

    open var shippedDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: SummaryOfSalesByQuarter.shippedDate))
        }
        set(value) {
            self.setDataValue(for: SummaryOfSalesByQuarter.shippedDate, to: value)
        }
    }

    open var subtotal: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: SummaryOfSalesByQuarter.subtotal))
        }
        set(value) {
            self.setDataValue(for: SummaryOfSalesByQuarter.subtotal, to: DecimalValue.of(optional: value))
        }
    }
}
