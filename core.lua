-- Created by @project-author@ character is Bearesquishy - dalaran please credit whenever.
-- Source on GitHub: https://n6rej.github.io
---@type
local addonName, addonTable = ...

-- Get the common Release names from Release.lua
--local E = addonTable.Shadowlands
local db = {}

-- Get reference to AdiBags addon
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local Result = {}

-- Debug mode switch
local debugMode = false

if debugMode then
	--@debug@
	--"Version: " .. '@project-version@'
	--@end-debug@
end

-- Merge filters if duplicate
local function MergeItems(filters1, filters2)
	local result = {}
	for item, value in pairs(filters1) do
		result[item] = value
	end
	for item, value in pairs(filters2) do
		result[item] = value
	end
	return result
end

-- Get list of existing filters
local function GetFilter(filterName)
	for key, value in AdiBags:IterateFilters() do
		if value.filterName == filterName then
			return value
		end
	end
end

-- Create Filters
local function CreateFilter(name, uiName, uiDesc, title, items)
	local filter = AdiBags:RegisterFilter(uiName, 98, "ABEvent-1.0")
	-- Register Filter with adibags
	filter.uiName = uiName
	filter.uiDesc = uiDesc .. "     Version: " .. "@project-version@"
	filter.items = items

	function filter:OnInitialize()
		-- Assign item table to filter
		self.items = filter.items
	end

	function filter:Update()
		self:SendMessage("AdiBags_FiltersChanged")
	end

	function filter:OnEnable()
		AdiBags:UpdateFilters()
	end

	function filter:OnDisable()
		AdiBags:UpdateFilters()
	end

	function filter:Filter(slotData)
		if self.items[tonumber(slotData.itemId)] then
			return title
		end
	end
end

-- Run filters
local function AllFilters(db)
	for name, group in pairs(db.Filters) do
		-- Get known filters
		local existingFilter = GetFilter(group.uiName)
		-- Does filter already exist?
		if existingFilter ~= nil then
			existingFilter.items = MergeItems(existingFilter.items, group.items)
			AdiBags:UpdateFilters()
		else
			-- name = Name of table
			-- group.uiName = Name to use in filter listing
			-- group.uiDesc = Description to show in filter listing
			-- group.items = table of items to sort
			CreateFilter(name, group.uiName, group.uiDesc, group.title, group.items)
		end
	end
end

-- START HERE
-- This will cycle thru each expansion listed in expansion.lua and run the database for that expansion.
for key, value in pairs(addonTable.expansion) do
	db = addonTable[value]
	if (db ~= nil) then
		AllFilters(db)
	end
end

-- Check if globaldbs is being used in toc
if (addonTable.Globaldbs ~= nil) then
	-- Now process global databases
	for key, value in pairs(addonTable.Globaldbs) do
		db = addonTable[value]
		if (db ~= nil) then
			AllFilters(db)
		end
	end
end
