WEBHOOK_URL = "/flex_hire"
class WebHooks::FlexHireController < ActionController::API
    before_action :flex_hire_params, only: [:create]

    def create
       api_key = flex_hire_params(:api_key)
       create_webhook_mutation
    end

    def show
        FlexHire.update_front_end(params)
    end
end

private

def create_webhook_mutation
    query_string = %|
        mutation createWebhook{
            createWebhook(input: {
                clientMutationId: "1234",
                enabled:true,
                url: "./#{WEBHOOK_URL}"
            }){
                clientMutationId,
                webhook {
                    authenticationHeaderName
                    id
                    url
                    webhookDeliveries {
                        totalCount
                    }
                }
            }
        }
    |

    GraphQL::Query.new(MySchema, query_string).result
end

def flex_hire_params(response)
  params.permit(:api_key)
end