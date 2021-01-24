# 元々の記述は全て削除して大丈夫です
server '54.238.253.176', user: 'ec2-user', roles: %w{app db web}
# 自身のElasticIPの部分は書き換えてください

set :rails_env, "production"
set :unicorn_rack_env, "production"