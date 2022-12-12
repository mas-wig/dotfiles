local M = {}

M.packer = {
	"PackerSnapshot",
	"PackerSnapshotRollback",
	"PackerSnapshotDelete",
	"PackerInstall",
	"PackerUpdate",
	"PackerSync",
	"PackerClean",
	"PackerCompile",
	"PackerStatus",
	"PackerProfile",
	"PackerLoad",
}

M.treesitter = {
	"TSInstall",
	"TSBufEnable",
	"TSBufDisable",
	"TSEnable",
	"TSDisable",
	"TSModuleInfo",
}

M.neotest = {
	"TestNearest",
	"TestFile",
	"TestSuite",
	"TestLast",
	"TestVisit",
}

M.overseer = {
	"OverseerToggle",
	"OverseerOpen",
	"OverseerRun",
	"OverseerBuild",
	"OverseerClose",
	"OverseerLoadBundle",
	"OverseerSaveBundle",
	"OverseerDeleteBundle",
	"OverseerRunCmd",
	"OverseerQuickAction",
	"OverseerTaskAction",
}

M.mason = {
	"Mason",
	"MasonInstall",
	"MasonInstallAll",
	"MasonUninstall",
	"MasonUninstallAll",
	"MasonLog",
}

M.dbui = {
	"DBUI",
	"DBUIAddConnection",
	"DBUIFindBuffer",
	"DBUILastQueryInfo",
	"DBUIToggle",
	"DBUIRenameBuffer",
}

M.code_runner = {
	"RunCode",
	"RunFile",
	"RunProject",
	"RunClose",
	"CRFiletype",
	"CRProjects",
}

M.trouble = {
	"Trouble",
	"TroubleClose",
	"TroubleRefresh",
	"TroubleToggle",
}

M.noetest_req = {
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
	"antoinemadec/FixCursorHold.nvim",
	"nvim-neotest/neotest-go",
	"haydenmeade/neotest-jest",
	"nvim-neotest/neotest-python",
}

M.neotest_want = {
	"plenary.nvim",
	"nvim-treesitter",
	"FixCursorHold.nvim",
	"neotest-go",
	"neotest-jest",
	"overseer.nvim",
	"neotest-python",
}

M.telescope_req = {
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope-media-files.nvim" },
}

M.dbui_req = {
	"kristijanhusak/vim-dadbod-ui",
}

M.flutter = {
	"FlutterRun",
	"FlutterDevices",
	"FlutterEmulators",
	"FlutterReload",
	"FlutterRestart",
	"FlutterQuit",
	"FlutterDetach",
	"FlutterOutlineToggle",
	"FlutterOutlineOpen",
	"FlutterDevTools",
	"FlutterCopyProfilerUrl",
	"FlutterLspRestart",
	"FlutterSuper",
	"FlutterReanalyze",
}

return M
