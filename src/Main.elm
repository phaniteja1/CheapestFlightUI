import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Http
import Json.Decode as Decode exposing (..)
import Json.Encode as Encode exposing (..)
import Random

main : Program Never Model Msg
main = 
    Html.program 
        { init = init 
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }

{- 
    MODEL
    * Model type 
    * Initialize model with empty values
-}

type alias Model =
    { flightno : String,
      price: String,
      depart: String,
      arrive: String
    }

init : (Model, Cmd Msg)
init =
    ( Model "flightnoDefault" "priceDefault" "departDefault" "arriveDefault", Cmd.none )

{-
   UPDATE
   * API routes
   * GET
   * Messages
   * Update case
-}
-- API request URLs

api : String
api =
    "https://api.myjson.com/bins/izuxp"


randomQuoteUrl : String
randomQuoteUrl =
    api



-- GET a random quote (unauthenticated)


-- fetchFlightDetails : String
-- fetchFlightDetails =
--     randomQuoteUrl


-- fetchFlightDetailsCmd : Http.Request String
-- fetchFlightDetailsCmd =
--     Http.get fetchFlightDetails flightDataDecoder

-- fetchFlightDetailsCompleted : Model -> Result Http.Error String -> ( Model, Cmd Msg )
-- fetchFlightDetailsCompleted model result =
--     case result of
--         Ok newFlight ->
--             ( { model | flightno = "", price = "", depart = "", arrive = "" }, Cmd.none )

--         Err _ ->
--             ( model, Cmd.none )

-- -- Decoder for flight data

-- flightDataDecoder : Decoder String

-- flightDataDecoder =
--     Decode.at ["flightno", "price", "depart", "arrive"] Decode.string

--------  My Server functions
-- GetFlightDetailsFromServer: 


-- Messages


type Msg
    = FetchFlightDetails
    | GetFlightDetailsFromServer



-- Update

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- GetFlightDetails ->
        --     ( model, fetchFlightDetailsCmd )

        -- FetchFlightDetailsCompleted result ->
        --     fetchFlightDetailsCompleted model result

        FetchFlightDetails -> 
            (model, getFlightDetailsFromServerCmd)

        GetFlightDetailsFromServer ->
            (Model, Cmd.none)

{-
    VIEW
-}


view : Model -> Html Msg
view model =
    div [ class "container" ] [
        h2 [ class "text-center" ] [ text "Cheapest Flight" ]
        , p [ class "text-center" ] [
            button [ class "btn btn-success", onClick FetchFlightDetails ] [ text "Get flight details!" ]
        ]
        -- Blockquote with quote
        , blockquote [] [ 
            p [] [text model.flightno] 
        ]
    ]