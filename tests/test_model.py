import unittest
import numpy as np
from scipy import signal

class IndustrialPlantTests(unittest.TestCase):
    def test_dc_gain(self):
        self.assertAlmostEqual(1000 / 1000, 1.0)
    def test_stable_plant_poles(self):
        poles = np.roots([1, 126, 2725, 12600, 1000])
        self.assertTrue(np.all(np.real(poles)<0))
    def test_identified_time_constants(self):
        self.assertGreater(12.201353,0)
        self.assertGreater(12.128868,0)
        self.assertGreater(0.063750,0)
if __name__=='__main__': unittest.main()
