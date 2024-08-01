## Set Up Keycloak
- [Red Hat](https://developers.redhat.com/blog/2018/10/08/configuring-nginx-keycloak-oauth-oidc#configuring_keycloak_and_nginx)

## OIDC Auhentication Error
**Error**: request to the redirect_uri path but there's no session state found \
**Url**: GET /redirect_uri?state=15e4586b457e96bcf8028edbe21cf1cd&session_state=97c66fe2-11dc-4b5c-b7ac-5ed288e980c9&code=eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..KNPNfnHkO0D8G8GeJ7RtMg.BjnsG9X0juh9BET1V9IDM8OcMlSJQMzbVwhKlhbQu0y8JpdpkUPGa8MiWRnstJugXOUuaEp5RJALigmX57lLSEV_fcF1tfg0H9Xy0YWPLkiNTsaxGdeln0H-knAu9DUnBsg1VlyirIdDnL8LN_BZPGDVdmi4sXUG3nKUcsjikc_o2uvql7xGa9nqVI-tDrxKj9b1Q4-xp8NxgdXC3tBwSDxgly-GaTqcI0VD7_lbl7f2TZ38LYB8FQ0VT3Vucu8x.NTUcy_U1OU4yXisMiwOsVg HTTP/1.1

**->**: The url contains session_state but the error is still there.