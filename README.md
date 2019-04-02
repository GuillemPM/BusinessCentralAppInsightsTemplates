# Introduction

Business Central in the cloud continuously emits telemetry about events that happen in the service.

This telemetry can be useful for partners, e.g., when troubleshooting an issue or to determine how often a feature is used.

As a developer of an app (typically referred to as an **ISV**), which gets installed in a Business Central environment, or as the partner on record for a customer (typically referred to as a **VAR**), you can obtain some of this telemetry.

This repo contains instructions for how you can obtain the telemetry.
It also contains resources that help you get immediate value from the telemetry.


# Obtain the telemetry in your AppInsights account

Business Central can send telemetry to one or more **Azure Application Insights** (AppInsights) accounts.
The first step thus is for you to create an AppInsights account.
See HERE for instructions on how to do that.
Once you have created the AppInsights account, make a note of the *instrumentation key*.

The next step depends on whether you are an ISV or a VAR.

If you are an **ISV**, you must specify the instrumentation key in your app.json file. Once you install your app in a Business Central environment, telemetry relating to yoru app will start to flow into your AppInsights account.

If you are a **VAR**, you must enter the instrumentation key in the Business Central Admin Center of your customer(s). Once you have done that, telemetry relating to your customers will start to flow into your AppInsights account.


# Query the telemetry

Once telemetry starts to flow into your AppInsights account, let's make the first simple query on it.

Follow these steps:
 1. Open the Azure portal and locate your AppInsights account
 2. Click "Search"
 3. Type "Page opened" and press Enter
Now you should see the times at which pages have been opened.

You can drill deeper by using the Analytics feature.

Follow these steps:
 1. Go to Overview page of the AppInsights account again
 2. Click "Analytics"
 3. Enter a query such as *traces | where message contains "Page Opened"*
 4. Run the query
Now you see the same events as before, but with more detail.
You can drill into each record and see details about which customer, which environment, which page, etc.

Analytics allows you to query the data in the way you want. You might create an ad-hoc query to solve a specific problem. But you might also create a query that you want to run again and again, e.g., a query that shows which pages are opened most often. For the latter case, perhaps you want to have the results shown in a dashboard - let's see how this can be done.


# Create a dashboard in the Azure portal

Suppose you have a query that shows how many times each page is shown, such as this one:
  traces | where message == "Page opened" | summarize NumberOfTimesOpened=count() by PageId=tostring(customDimensions.PageId)

If you execute it in the Analytics section, you can also find a "Pin" button. If you click it, you can select to pin your query on a dashboard. Now, whenever you go to the dashboard, the query will re-execute, and you will see the up-to-date results.


# Template dashboards

To reduce the time-to-value for you, we have prepared a set of dashboards that you can upload to your Azure portal.

Each dashboard is simply a JSON file that describes which *widgets* the dashboard should contain. The JSON file contains placeholders for AppInsights instance, and in order to use the dashboards, you effectively have to do a search&replace in the JSON file such that it is *your* Azure subscription that is iused.

You will find multiple dashboards, targeted at either **ISVs** or **VARs**, and focusing on different aspects such as the usage and performance of your exposed OData web services.

When you find a dashboard that you would like to try, you can perform the following steps:
 1. Run the PrepareDashboard.ps1 file (specify the dashboard you want to use, as well as your AppInsights details)
 2. Open the Azure portal and go to the Dashboard section
 3. Click "Upload" and select the file that was produced in step 1
If you don't like the new dashboard, you can simply delete it again.


# Clone the repo

We know that the dashboards we have provided might not match your needs exactly, and if you want to customize them, we recommend that you clone this repo and make your adjustments there, before importing the dashboard in the Azure portal.

As we improve our dashboards, you can merge the changes into your cloned repo and in this way stay up-to-date.
