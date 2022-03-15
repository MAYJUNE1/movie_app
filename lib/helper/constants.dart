// ignore_for_file: constant_identifier_names

const String BASE_URL = "https://api.themoviedb.org/3/";
const String API_KEY = "?api_key=4450407b6d1d60623d955f1bc9c6a9a3";
const int API_TIMEOUT = 1;

const String UPCOMING_URL = BASE_URL + 'movie/upcoming' + API_KEY;
const String POPULAR_URL = BASE_URL + 'movie/popular' + API_KEY;
const String NOWPLAYING_URL = BASE_URL + 'movie/now_playing' + API_KEY;
const String TOPMOVIE_URL = BASE_URL + 'movie/top_rated' + API_KEY;
const String MOVIEDETAILS_URL = BASE_URL + 'movie/{movieId}' + API_KEY;
const String CASTDETAILS_URL =
    BASE_URL + 'movie/{movieId}' + '/credits' + API_KEY;
const String MOVIEGENRE_URL = BASE_URL + 'genre/movie/list' + API_KEY;
const String GETMOVIEBYGENRE_URL =
    BASE_URL + 'discover/movie' + API_KEY + '&with_genres={genreId}';
const String GETPERSON_URL =
    'https://api.themoviedb.org/3/person/{personId}?api_key=4450407b6d1d60623d955f1bc9c6a9a3&append_to_response=combined_credits';

const String GETPOSTERIMG_URL = "https://image.tmdb.org/t/p/original";
