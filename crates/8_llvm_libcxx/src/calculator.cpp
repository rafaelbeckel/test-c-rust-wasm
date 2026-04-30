#include "calculator.h"

#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>

/**
 * C++ Calculator class demonstrating real C++ standard library usage.
 *
 * This class uses:
 *   - std::vector<unsigned int> for operation result history
 *   - std::string + snprintf for formatted output
 *
 * These require a full C++ standard library (LLVM libc++) and a
 * C standard library (musl libc) underneath.
 */
class CalculatorImpl {
public:
    CalculatorImpl() = default;
    ~CalculatorImpl() { clear_memory(); }

    unsigned int add(unsigned int a, unsigned int b) {
        unsigned int result = a + b;
        history_.push_back(result);
        return result;
    }

    unsigned int subtract(unsigned int a, unsigned int b) {
        unsigned int result = rust_subtract(a, b);
        history_.push_back(result);
        return result;
    }

    unsigned int multiply(unsigned int a, unsigned int b) {
        unsigned int result = rust_multiply(a, b);
        history_.push_back(result);
        return result;
    }

    unsigned int divide(unsigned int a, unsigned int b) {
        if (b == 0) return 0;
        unsigned int quotient = 0;
        while (a >= b) {
            a = rust_subtract(a, b);
            quotient = this->add(quotient, 1);
            // Remove the intermediate add from history
            history_.pop_back();
        }
        history_.push_back(quotient);
        return quotient;
    }

    void store_value(unsigned int value) { store(value); }
    unsigned int retrieve_value() { return retrieve(); }
    void clear_memory() { clear(); }

    unsigned int history_count() const {
        return static_cast<unsigned int>(history_.size());
    }

    unsigned int history_get(unsigned int index) const {
        if (index < history_.size()) {
            return history_[index];
        }
        return 0;
    }

    void history_clear() { history_.clear(); }

    int format_last(char *buf, unsigned int buf_len) {
        if (history_.empty()) {
            return snprintf(buf, buf_len, "(no results)");
        }
        unsigned int last = history_.back();
        std::string label = "Last result";
        return snprintf(buf, buf_len, "%s: %u (of %zu operations)",
                       label.c_str(), last, history_.size());
    }

private:
    std::vector<unsigned int> history_;
};

// C API wrappers

extern "C" {

CxxCalculator *calculator_new() {
    return reinterpret_cast<CxxCalculator *>(new CalculatorImpl());
}

void calculator_free(CxxCalculator *calc) {
    delete reinterpret_cast<CalculatorImpl *>(calc);
}

unsigned int calculator_add(CxxCalculator *calc, unsigned int a, unsigned int b) {
    return reinterpret_cast<CalculatorImpl *>(calc)->add(a, b);
}

unsigned int calculator_subtract(CxxCalculator *calc, unsigned int a, unsigned int b) {
    return reinterpret_cast<CalculatorImpl *>(calc)->subtract(a, b);
}

unsigned int calculator_multiply(CxxCalculator *calc, unsigned int a, unsigned int b) {
    return reinterpret_cast<CalculatorImpl *>(calc)->multiply(a, b);
}

unsigned int calculator_divide(CxxCalculator *calc, unsigned int a, unsigned int b) {
    return reinterpret_cast<CalculatorImpl *>(calc)->divide(a, b);
}

void calculator_store(CxxCalculator *calc, unsigned int value) {
    reinterpret_cast<CalculatorImpl *>(calc)->store_value(value);
}

unsigned int calculator_retrieve(CxxCalculator *calc) {
    return reinterpret_cast<CalculatorImpl *>(calc)->retrieve_value();
}

void calculator_clear(CxxCalculator *calc) {
    reinterpret_cast<CalculatorImpl *>(calc)->clear_memory();
}

unsigned int calculator_history_count(CxxCalculator *calc) {
    return reinterpret_cast<CalculatorImpl *>(calc)->history_count();
}

unsigned int calculator_history_get(CxxCalculator *calc, unsigned int index) {
    return reinterpret_cast<CalculatorImpl *>(calc)->history_get(index);
}

void calculator_history_clear(CxxCalculator *calc) {
    reinterpret_cast<CalculatorImpl *>(calc)->history_clear();
}

int calculator_format_last(CxxCalculator *calc, char *buf, unsigned int buf_len) {
    return reinterpret_cast<CalculatorImpl *>(calc)->format_last(buf, buf_len);
}

} // extern "C"
