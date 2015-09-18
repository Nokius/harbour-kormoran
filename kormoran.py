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

consumerKey = "GSNPS0n95g46qdHcWPvtcA"
consumerSecret = "lKqZn8UK8R5e5rmcfEPxm3kn9UQ4lqGONsMilrR4oM"


def getAuthorizationUrl():
    auth = tweepy.OAuthHandler(consumerKey, consumerSecret)
    try:
        redirect_url = auth.get_authorization_url()
        return redirect_url
    except tweepy.TweepError:
        pyotherside.send("Error! Failed to get request token.")
        return ""
