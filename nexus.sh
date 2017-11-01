# Copyright (c) 2017-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

docker-compose up -d --build

until curl --fail --insecure https://localhost; do 
  sleep 1
done

curl -v -u admin:admin123 --insecure --header 'Content-Type: application/json' 'https://localhost/service/siesta/rest/v1/script' -d @nexus-repository/create-docker-proxy.json
curl -v -X POST -u admin:admin123 --insecure --header 'Content-Type: text/plain' 'https://localhost/service/siesta/rest/v1/script/CreateDockerProxy/run'
