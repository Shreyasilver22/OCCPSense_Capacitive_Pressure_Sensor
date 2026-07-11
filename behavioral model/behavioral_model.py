def c_to_voltage(c_sensor):
    return (c_sensor - 5) / (10 - 5) * 3.3


def voltage_to_code(voltage):
    return int(voltage / 3.3 * (2**8-1))


def sar_adc(vin, vref=3.3, bits=8):
    result = 0
    for i in range(bits):
        bit = bits - 1 - i
        result = result | (1 << bit)
        vdac = result / 255 * vref
        if vdac > vin:
            result = result & ~(1 << bit)
    return result


def sensor_to_code(c_sensor):
    voltage = c_to_voltage(c_sensor)
    return voltage_to_code(voltage)


def sensor_to_code_sar(c_sensor):
    voltage = c_to_voltage(c_sensor)
    return sar_adc(voltage)

import matplotlib.pyplot as plt
import numpy as np

c_values = np.linspace(5, 10, 100)
codes_ideal = [sensor_to_code(c) for c in c_values]
codes_sar = [sensor_to_code_sar(c) for c in c_values]

plt.plot(c_values, codes_ideal, label="Ideal")
plt.plot(c_values, codes_sar, label="SAR simulation", linestyle='--')
plt.xlabel("Capacitance (pF)")
plt.ylabel("ADC Output Code")
plt.title("Sensor Capacitance vs ADC Code (8-bit)")
plt.legend()
plt.grid(True)
plt.show()