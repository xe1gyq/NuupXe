#!/usr/bin/python

import logging
import ConfigParser

from core.alive import Alive
from core.morse import Morse
from core.phonetic import Phonetic
from core.voicesynthetizer import VoiceSynthetizer

class Identification(object):

    def __init__(self, voicesynthetizer):

        self.modulename = 'Identification'
        self.phonetic = Phonetic()
        self.morse = Morse()
        self.voicesynthetizer = voicesynthetizer
        
        self.conf = ConfigParser.ConfigParser()
        self.path = "configuration/general.config"
        self.conf.read(self.path)

    def alive(self):
        self.alive = Alive()
        self.alive.report(self.modulename)

    def setup(self):
        logging.info('Identification Setup')
        self.message = self.conf.get("general", "radioclub")
        self.message = self.message + ', ' + ' '.join(self.phonetic.decode(self.conf.get("general", "callsign")))
        self.message = "\"" + self.message + "\""
        self.callsign = self.conf.get("general", "callsign")

    def identify(self):
        logging.info('Identification Identify')
        self.alive()
        self.setup()
        self.morse.generate('cq cq ' + self.callsign)
        self.voicesynthetizer.speechit(self.message)

# End of File
