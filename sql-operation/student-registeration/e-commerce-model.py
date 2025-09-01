from sqlalchemy import (
    create_engine,
    String,
    Text,
    ForeignKey,
    UniqueConstraint
)
from sqlalchemy.orm import (
    DeclarativeBase,
    Mapped,
    mapped_column,
    relationship
)


# ---------- Base Declaration ----------

class Base(DeclarativeBase):
    pass


# ---------- Models ----------

class SssUser(Base):
    __tablename__ = "sss_users"

    id: Mapped[str] = mapped_column(Text, primary_key=True)
    email: Mapped[str] = mapped_column(String(255), unique=True, nullable=False)
    password: Mapped[str] = mapped_column(String(255), nullable=False)

    orders: Mapped[list["SssOrder"]] = relationship("SssOrder", back_populates="user", cascade="all, delete")


class SssInventory(Base):
    __tablename__ = "sss_inventory"

    id: Mapped[str] = mapped_column(Text, primary_key=True)
    sku_code: Mapped[str] = mapped_column(String(255), unique=True)
    description: Mapped[str] = mapped_column(Text)

    order_details: Mapped[list["SssOrderDetails"]] = relationship("SssOrderDetails", back_populates="inventory", cascade="all, delete")


class SssOrder(Base):
    __tablename__ = "sss_order"

    id: Mapped[str] = mapped_column(Text, primary_key=True)
    user_id: Mapped[str] = mapped_column(ForeignKey("sss_users.id", ondelete="CASCADE"), nullable=False)

    user: Mapped["SssUser"] = relationship("SssUser", back_populates="orders")
    order_details: Mapped[list["SssOrderDetails"]] = relationship("SssOrderDetails", back_populates="order", cascade="all, delete")


class SssOrderDetails(Base):
    __tablename__ = "sss_order_details"
    __table_args__ = (
        UniqueConstraint("order_id", "inventory_id", name="uq_order_inventory"),
    )

    id: Mapped[str] = mapped_column(Text, primary_key=True)
    order_id: Mapped[str] = mapped_column(ForeignKey("sss_order.id", ondelete="CASCADE"), nullable=False)
    inventory_id: Mapped[str] = mapped_column(ForeignKey("sss_inventory.id", ondelete="CASCADE"), nullable=False)

    order: Mapped["SssOrder"] = relationship("SssOrder", back_populates="order_details")
    inventory: Mapped["SssInventory"] = relationship("SssInventory", back_populates="order_details")

