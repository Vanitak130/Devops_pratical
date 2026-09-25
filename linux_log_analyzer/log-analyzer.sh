
#!/bin/bash

 echo "Report Generated: $(date)"


LOG_FILE="sample_logs/sample.log"

echo "=============================="
echo "      LOG ANALYZER"
echo "=============================="

echo "Log file: $LOG_FILE"
echo ""

echo "INFO messages:"
grep "INFO" "$LOG_FILE" | wc -l

echo "WARNING messages:"
grep "WARNING" "$LOG_FILE" | wc -l

echo "ERROR messages:"
grep "ERROR" "$LOG_FILE" | wc -l

echo ""

echo "Failed SSH login attempts:"
grep "Failed SSH login" "$LOG_FILE" | wc -l

echo ""

echo "Failed login IP addresses:"
grep "Failed SSH login" "$LOG_FILE" | awk '{print $NF}' | sort | uniq -c

echo ""

echo "Most frequent errors:"
grep "ERROR" "$LOG_FILE" | cut -d' ' -f4- | sort | uniq -c | sort -nr

echo "=============================="
echo "      ANALYSIS COMPLETE"
echo "=============================="


