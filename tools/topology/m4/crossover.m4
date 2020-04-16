divert(-1)

dnl Define macro for crossover widget

dnl Crossover name)
define(`N_CROSSOVER', `CROSSOVER'PIPELINE_ID`.'$1)

dnl W_CROSSOVER(name, format, periods_sink, periods_source, kcontrol_list)
define(`W_CROSSOVER',
`SectionVendorTuples."'N_CROSSOVER($1)`_tuples_w" {'
`	tokens "sof_comp_tokens"'
`	tuples."word" {'
`		SOF_TKN_COMP_PERIOD_SINK_COUNT'		STR($3)
`		SOF_TKN_COMP_PERIOD_SOURCE_COUNT'	STR($4)
`	}'
`}'
`SectionData."'N_CROSSOVER($1)`_data_w" {'
`	tuples "'N_CROSSOVER($1)`_tuples_w"'
`}'
`SectionVendorTuples."'N_CROSSOVER($1)`_tuples_str" {'
`	tokens "sof_comp_tokens"'
`	tuples."string" {'
`		SOF_TKN_COMP_FORMAT'	STR($2)
`	}'
`}'
`SectionVendorTuples."'N_CROSSOVER($1)`_crossover_process_tuples_str" {'
`	tokens "sof_process_tokens"'
`	tuples."string" {'
`		SOF_TKN_PROCESS_TYPE'		"CROSSOVER"
`	}'
`}'
`SectionData."'N_CROSSOVER($1)`_data_str" {'
`	tuples "'N_CROSSOVER($1)`_tuples_str"'
`	tuples "'N_CROSSOVER($1)`_crossover_process_tuples_str"'
`}'
`SectionWidget."'N_CROSSOVER($1)`" {'
`	index "'PIPELINE_ID`"'
`	type "effect"'
`	no_pm "true"'
`	data ['
`		"'N_CROSSOVER($1)`_data_w"'
`		"'N_CROSSOVER($1)`_data_str"'
`	]'
`	bytes ['
		$5
`	]'
`}')

divert(0)dnl
