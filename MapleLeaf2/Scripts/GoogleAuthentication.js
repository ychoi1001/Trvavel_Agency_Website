
function getAccessToken() {
    if (location.hash) {
        if (location.hash.split('state=')) {
            var accessToken = location.hash.split('state=')[1].split('&')[0];
            if (asccessToken) {
                isUserRegistered(acessToken);
            }
        }
    }
}
