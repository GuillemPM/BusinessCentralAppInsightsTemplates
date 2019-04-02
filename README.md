# Introduction

Business Central in the cloud continuously emits telemetry about events that happen in the service.

This telemetry can be useful for partners while troubleshooting an issue or to determine how often a feature is used.

As a developer of an app (typically referred to as an ISV) that is installed in a Business Central environment, or as the partner on record for a customer (typically referred to as a VAR), you can obtain this telemetry.

This repository contains instructions for how you can obtain the telemetry.
This repository also contains resources that help you get immediate value from the telemetry.


# How to obtain the telemetry

Business Central can send telemetry to one or more **Azure Application Insights** (AppInsights) accounts.
The first step thus is for you to create an AppInsights account.
See HERE for instructions on how to do that.
Once you have created the AppInsights account, make a note of the *instrumentation key*.

The next step depends on whether you are an ISV or a VAR.

If you are an ISV, you must specify the instrumentation key in your app.json file. Once you install your app in a Business Central environment, telemetry relating to yoru app will start to flow into your AppInsights account.

If you are a VAR, you must enter the instrumentation key in the Business Central Admin Center of your customer(s). Once you have done that, telemetry relating to your customers will start to flow into your AppInsights account.


# Querying the telemetry

Once telemetry starts to flow into your AppInsights account, let's make the first simple query on it.

Follow these steps:
 1. Open the Azure portal and locate your AppInsights account
 2. Click "Search"
 3. Type "Page opened" and press Enter
Now you should see the times at which pages have been opened.

You can drill deeper by using the Log Analytics feature.

Follow these steps:
 1. Go to Overview page of the AppInsights account again
 2. Click "Log Analytics"
 3. Enter a query such as *traces | where message contains "Page Opened"*
 4. Run the query
Now you see the same events as before, but with more detail.
You can drill into each record and see details about which customer, which environment, which page, etc.


# Template dashboards etc. for Business Central telemetry



This repository contains resources that help Business Central partners to quickly get value from Business Central telemetry.

The repository contains template dashboards, which can be uploaded to the Azure portal
