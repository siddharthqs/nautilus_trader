# Warning, this file is autogenerated by cbindgen. Don't modify this manually. */

from libc.stdint cimport uint8_t, uint64_t, uintptr_t

cdef extern from "../includes/core.h":

    cpdef enum MessageCategory:
        COMMAND # = 1,
        DOCUMENT # = 2,
        EVENT # = 3,
        REQUEST # = 4,
        RESPONSE # = 5,

    cdef struct Rc_String:
        pass

    # CVec is a C compatible struct that stores an opaque pointer to a block of
    # memory, it's length and the capacity of the vector it was allocated from.
    #
    # NOTE: Changing the values here may lead to undefined behaviour when the
    # memory is dropped.
    cdef struct CVec:
        # Opaque pointer to block of memory storing elements to access the
        # elements cast it to the underlying type.
        void *ptr;
        # The number of elements in the block.
        uintptr_t len;
        # The capacity of vector from which it was allocated.
        # Used when deallocating the memory
        uintptr_t cap;

    cdef struct UUID4_t:
        Rc_String *value;

    void cvec_drop(CVec cvec);

    CVec cvec_new();

    # Converts seconds to nanoseconds (ns).
    uint64_t secs_to_nanos(double secs);

    # Converts seconds to milliseconds (ms).
    uint64_t secs_to_millis(double secs);

    # Converts milliseconds (ms) to nanoseconds (ns).
    uint64_t millis_to_nanos(double millis);

    # Converts microseconds (μs) to nanoseconds (ns).
    uint64_t micros_to_nanos(double micros);

    # Converts nanoseconds (ns) to seconds.
    double nanos_to_secs(uint64_t nanos);

    # Converts nanoseconds (ns) to milliseconds (ms).
    uint64_t nanos_to_millis(uint64_t nanos);

    # Converts nanoseconds (ns) to microseconds (μs).
    uint64_t nanos_to_micros(uint64_t nanos);

    const char *message_category_to_cstr(MessageCategory value);

    # Returns an enum from a C string.
    #
    # # Safety
    # - Assumes `ptr` is a valid C string pointer.
    MessageCategory message_category_from_cstr(const char *ptr);

    # Drops the C string memory at the pointer.
    #
    # # Safety
    # - Assumes `ptr` is a valid C string pointer.
    # # Panics
    # - If `ptr` is null.
    void cstr_free(const char *ptr);

    # Returns the current seconds since the UNIX epoch.
    # This timestamp is guaranteed to be monotonic within a runtime.
    double unix_timestamp();

    # Returns the current milliseconds since the UNIX epoch.
    # This timestamp is guaranteed to be monotonic within a runtime.
    uint64_t unix_timestamp_ms();

    # Returns the current microseconds since the UNIX epoch.
    # This timestamp is guaranteed to be monotonic within a runtime.
    uint64_t unix_timestamp_us();

    # Returns the current nanoseconds since the UNIX epoch.
    # This timestamp is guaranteed to be monotonic within a runtime.
    uint64_t unix_timestamp_ns();

    UUID4_t uuid4_new();

    UUID4_t uuid4_clone(const UUID4_t *uuid4);

    void uuid4_free(UUID4_t uuid4);

    # Drops the string from a C string pointer.
    #
    # # Safety
    # - Assumes `ptr` is a valid C String pointer.
    # # Panics
    # - If `ptr` is null.
    UUID4_t uuid4_from_cstr(const char *ptr);

    const char *uuid4_to_cstr(const UUID4_t *uuid);

    uint8_t uuid4_eq(const UUID4_t *lhs, const UUID4_t *rhs);

    uint64_t uuid4_hash(const UUID4_t *uuid);
