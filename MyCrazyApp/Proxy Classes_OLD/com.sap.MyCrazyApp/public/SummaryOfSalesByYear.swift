// # Proxy Compiler 17.3.1-8d1214-20170404

import Foundation
import SAPOData

open class SummaryOfSalesByYear: EntityValue {
    public static let shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "ShippedDate")

    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "OrderID")

    public static let subtotal: Property = NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear.property(withName: "Subtotal")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.summaryOfSalesByYear)
    }

    open class func array(from: EntityValueList) -> Array<SummaryOfSalesByYear> {
        return ArrayConverter.convert(from.toArray(), Array<SummaryOfSalesByYear>())
    }

    open func copy() -> SummaryOfSalesByYear {
        return CastRequired<SummaryOfSalesByYear>.from(self.copyEntity())
    }

    open class func key(orderID: Int) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(orderID))
    }

    open var old: SummaryOfSalesByYear {
        get {
            return CastRequired<SummaryOfSalesByYear>.from(self.oldEntity)
        }
    }

    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: SummaryOfSalesByYear.orderID))
        }
        set(value) {
            self.setDataValue(for: SummaryOfSalesByYear.orderID, to: IntValue.of(value))
        }
    }

    open var shippedDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: SummaryOfSalesByYear.shippedDate))
        }
        set(value) {
            self.setDataValue(for: SummaryOfSalesByYear.shippedDate, to: value)
        }
    }

    open var subtotal: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: SummaryOfSalesByYear.subtotal))
        }
        set(value) {
            self.setDataValue(for: SummaryOfSalesByYear.subtotal, to: DecimalValue.of(optional: value))
        }
    }
}
