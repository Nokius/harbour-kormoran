#
#  Kormoran
#  Copyright (C) 2015 Hauke Wesselmann
#  Contact: Hauke Wesselmann <hauke@h-dawg.de>
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.
#

import tweepy
import pyotherside
import json
import traceback

consumerKey = "GSNPS0n95g46qdHcWPvtcA"
consumerSecret = "lKqZn8UK8R5e5rmcfEPxm3kn9UQ4lqGONsMilrR4oM"
auth = tweepy.OAuthHandler(consumerKey, consumerSecret)


def getAuthorizationUrl():
    try:
        redirect_url = auth.get_authorization_url()
        return redirect_url
    except tweepy.TweepError:
        pyotherside.send("Error! Failed to get request token.")
        return ""


def retrieveAccessToken(verifier, dataPath):
    try:
        auth.get_access_token(verifier)
        tokData = {
            'authToken': auth.access_token,
            'authTokenSecret': auth.access_token_secret
        }
        with open(dataPath + '/tokenData.json', 'w') as f:
            json.dump(tokData, f)
    except tweepy.TweepError:
        pyotherside.send("Error! Failed to get access token.")


def initializeAPI(dataPath):
    try:
        with open(dataPath + '/tokenData.json', 'r') as f:
            tokData = json.load(f)
        auth.set_access_token(tokData['authToken'], tokData['authTokenSecret'])
        return 1
    except:
        pyotherside.send(traceback.print_exc())
        return 0


def loadTimeline():
    api = tweepy.API(auth)
    status = api.home_timeline()
    return "retrun json objects with data to display here"


def testAPI():
    api = tweepy.API(auth)
    api.update_status('Test4!')
