import { combineReducers } from 'redux';
import entitiesReducer from './entities_reducer';
import errorsReducer from './errors_reducer';
import sessionReducer from './session_reducer';


export default combineReducers({
  entities: entitiesReducer,
  errors: errorsReducer,
  session: sessionReducer
  // We can add as many reducers as we need here.
});
