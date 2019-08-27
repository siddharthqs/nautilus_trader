# -------------------------------------------------------------------------------------------------
# <copyright file="account.pxd" company="Nautech Systems Pty Ltd">
#  Copyright (C) 2015-2019 Nautech Systems Pty Ltd. All rights reserved.
#  The use of this source code is governed by the license as found in the LICENSE.md file.
#  https://nautechsystems.io
# </copyright>
# -------------------------------------------------------------------------------------------------

from cpython.datetime cimport datetime

from nautilus_trader.core.types cimport ValidString
from nautilus_trader.model.c_enums.currency cimport Currency
from nautilus_trader.model.events cimport AccountStateEvent
from nautilus_trader.model.identifiers cimport Brokerage, AccountNumber, AccountId


cdef class Account:
    """
    Represents a brokerage account.
    """
    cdef list _events

    cdef readonly bint initialized
    cdef readonly AccountId id
    cdef readonly Brokerage broker
    cdef readonly AccountNumber number
    cdef readonly Currency currency
    cdef readonly free_equity
    cdef readonly cash_balance
    cdef readonly cash_start_day
    cdef readonly cash_activity_day
    cdef readonly margin_used_liquidation
    cdef readonly margin_used_maintenance
    cdef readonly margin_ratio
    cdef readonly ValidString margin_call_status
    cdef readonly datetime last_updated
    cdef readonly AccountStateEvent last_event
    cdef readonly int event_count

    cpdef list get_events(self)
    cpdef void initialize(self, AccountStateEvent event)
    cpdef void apply(self, AccountStateEvent event)
    cpdef void reset(self)
