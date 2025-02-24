all:
	uv run runscripts/workflow.py --config ecoli/composites/ecoli_configs/our_test.json

clean:
	rm -rf out trace-*