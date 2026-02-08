OWNER ?= t81dev

.PHONY: ops-weekly
ops-weekly:
	./scripts/ops-weekly.sh $(OWNER)
