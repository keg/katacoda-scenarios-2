while [ ! `ls -l /root/k8s-yaml-files/*.yaml 2>/dev/null | wc -l ` -eq 5 ]; do
  sleep 0.3
done
while [ ! 'k get nodes 2>/dev/null | wc -l ' eq 2]; do
  sleep 0.3
done

sed -i 's|--DATADOG_API_KEY--|datadog/agent:6.11.1|' docker-compose.yml

helm install datadogagent --set datadog.apiKey=$DD_API_KEY --set datadog.appKey=$DD_APP_KEY -f k8s-yaml-files/values.yaml stable/datadog
clear
prepenvironment